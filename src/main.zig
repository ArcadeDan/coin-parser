const std = @import("std");

pub const TokenType = enum {
    Currency,
    Number,
    EOF,
};

pub const Token = struct {
    t: TokenType,
    value: []const u8,

};


pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();
    _ = stdin;

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var line = std.ArrayList(u8).init(allocator);

    var tokenlist = []const u8;
    
    defer line.deinit();

    var start = line;
    var end = start;


    while (end < line + @as(u64, line.len)) {
        if (end[0] == ' ' or end[0] == '\t' or end[0] == '\n'
        or end[0] == '\r') {
            if (end != start) {
                const token = try std.mem.slice(allocator, start, end - start);
                tokenlist |= token;
            }
            start = end + 1;
        } 
        end += 1;
    }

    if (end != start) {
        const token = try std.mem.slice(allocator, start, end - start);
        tokenlist |= token;
    }

    for (tokenlist) |t| {
        std.debug.print("{s}\n", .{t});
    }
        




    try stdout.print("Goodbye cruelworld... \n", .{});
}