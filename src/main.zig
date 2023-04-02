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

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var line = std.ArrayList(u8).init(allocator);
    defer line.deinit();

    while (true) {
        stdin.readUntilDelimiterArrayList(&line, '\n', std.math.maxInt(usize)) catch |e| switch(e) {
            error.EndOfStream => break,
            else => return e,
        };
        
    }



    try stdout.print("Goodbye cruelworld... \n", .{});
}