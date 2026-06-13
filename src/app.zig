const std = @import("std");
const help = @import("commands/help.zig");

pub const App = struct {
    pub fn run(writer: anytype) !void {
        try writer.writeAll("Zigdexer baseline CLI\n");
        try help.render(writer);
    }
};

pub fn run(writer: anytype) !void {
    try App.run(writer);
}

test "run prints banner and command help" {
    var buffer: [256]u8 = undefined;
    var stream = std.io.fixedBufferStream(&buffer);

    try run(stream.writer());

    try std.testing.expectEqualStrings(
        "Zigdexer baseline CLI\nAvailable commands:\n  help    Show this help message\n",
        stream.getWritten(),
    );
}
