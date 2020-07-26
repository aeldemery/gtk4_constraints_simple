int main (string[] args) {
    var app = new Gtk4Demo.SimpleConstraintsApp ();
    return app.run (args);
}

public class Gtk4Demo.SimpleConstraintsApp : Gtk.Application {
    public SimpleConstraintsApp () {
        Object (
            application_id: "github.aeldemery.gtk4_constraints_simple",
            flags : GLib.ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        var win = active_window;
        if (win == null) {
            win = new MainWindow (this);
        }
        win.present ();
    }
}