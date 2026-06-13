const std = @import("std");

pub const help_text =
    \\Available commands:
    \\  help    Show this help message
;

pub fn render(writer: anytype) !void {
    try writer.writeAll(help_text);
}

test "render includes help command" {
    var buffer: [128]u8 = undefined;
    var stream = std.io.fixedBufferStream(&buffer);

    try render(stream.writer());

    try std.testing.expect(std.mem.indexOf(u8, stream.getWritten(), "help") != null);
}
