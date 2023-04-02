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
    



    try stdout.print("Hello, world!\n", .{});
}