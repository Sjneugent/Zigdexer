const std = @import("std");
const app = @import("app.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try app.run(stdout);
}

test "main path is executable via app runner" {
    var buffer: [256]u8 = undefined;
    var stream = std.io.fixedBufferStream(&buffer);

    try app.run(stream.writer());
    try std.testing.expect(std.mem.startsWith(u8, stream.getWritten(), "Zigdexer baseline CLI"));
}
