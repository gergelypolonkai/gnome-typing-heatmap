using Gtk;

[GtkTemplate (ui = "/eu/polonkai/gergely/typingheatmap/main-window.ui")]
public class ApplicationWindow : Gtk.ApplicationWindow {
    [GtkChild]
    private Gkbd.KeyboardDrawing keyboard_drawing;

    public ApplicationWindow(Gtk.Application app)
    {
        Object(application: app,
               title: "Typing Heatmap");

        keyboard_drawing.set_layout("hu(dvorak)");

        this.show();
    }

    [GtkCallback]
    public void
    on_destroy()
    {
        application.quit();
    }
}

public class Application : Gtk.Application {
    public Application()
    {
        Object(application_id: "eu.polonkai.gergely.typing_heatmap");
    }

    protected override void
    activate()
    {
        assert(this is Gtk.Application);
        new ApplicationWindow(this);
    }
}

static int
main(string[] args) {
    return new Application().run(args);
}
