using Gtk;
public class Gtk4Demo.MainWindow : ApplicationWindow {
    public MainWindow (Gtk.Application app) {
        Object (application: app);
    }

    construct {
        title = "Simple Constraints";

        var header = new HeaderBar ();
        header.show_title_buttons = true;
        set_titlebar (header);

        var vbox = new Box (Orientation.VERTICAL, 12);
        set_child (vbox);

        var simple_grid = new SimpleGrid ();
        simple_grid.vexpand = true;
        simple_grid.hexpand = true;
        vbox.append (simple_grid);

        var colse_button = new Button.with_label ("Close");
        colse_button.clicked.connect (() => {
            destroy ();
        });
        vbox.append (colse_button);
    }
}