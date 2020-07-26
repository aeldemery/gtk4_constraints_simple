using Gtk;
public class Gtk4Demo.SimpleGrid : Widget {
    Button button1;
    Button button2;
    Button button3;

    static construct {
        set_layout_manager_type (typeof (ConstraintLayout));
    }

    construct {
        button1 = new Button.with_label ("Button 1");
        button1.name = "button1";
        button2 = new Button.with_label ("Button 2");
        button2.name = "button2";
        button3 = new Button.with_label ("Button 3");
        button3.name = "button3";

        button1.set_parent (this);
        button2.set_parent (this);
        button3.set_parent (this);

        /* Layout:
         *
         *   +-------------------------------------+
         *   | +-----------++-------++-----------+ |
         *   | |  Child 1  || Space ||  Child 2  | |
         *   | +-----------++-------++-----------+ |
         *   | +---------------------------------+ |
         *   | |             Child 3             | |
         *   | +---------------------------------+ |
         *   +-------------------------------------+
         *
         * Constraints:
         *
         *   super.start = child1.start - 8
         *   child1.width = child2.width
         *   child1.end = space.start
         *   space.end = child2.start
         *   child2.end = super.end - 8
         *   super.start = child3.start - 8
         *   child3.end = super.end - 8
         *   super.top = child1.top - 8
         *   super.top = child2.top - 8
         *   child1.bottom = child3.top - 12
         *   child2.bottom = child3.top - 12
         *   child3.height = child1.height
         *   child3.height = child2.height
         *   child3.bottom = super.bottom - 8
         *
         * To add some flexibility, we make the space
         * stretchable:
         *
         *   space.width >= 10
         *   space.width = 100
         *   space.width <= 200
         */

        // Build Constraints
        var manager = (ConstraintLayout) layout_manager;
        var guide = new ConstraintGuide ();

        guide.name = "space";
        guide.set_min_size (10, 10);
        guide.set_nat_size (100, 10);
        guide.set_max_size (200, 20);
        guide.set_strength (ConstraintStrength.REQUIRED);
        manager.add_guide (guide);

        var constraint = new Constraint.const (
            button1, ConstraintAttribute.WIDTH, ConstraintRelation.LE,
            200, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            null, ConstraintAttribute.START, ConstraintRelation.EQ,
            button1, ConstraintAttribute.START, 1.0, -8.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button1, ConstraintAttribute.WIDTH, ConstraintRelation.EQ,
            button2, ConstraintAttribute.WIDTH, 1.0, 0.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button1, ConstraintAttribute.END, ConstraintRelation.EQ,
            guide, ConstraintAttribute.START, 1.0, 0.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            guide, ConstraintAttribute.END, ConstraintRelation.EQ,
            button2, ConstraintAttribute.START, 1.0, 0.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button2, ConstraintAttribute.END, ConstraintRelation.EQ,
            null, ConstraintAttribute.END, 1.0, -8.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            null, ConstraintAttribute.START, ConstraintRelation.EQ,
            button3, ConstraintAttribute.START, 1.0, -8.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button3, ConstraintAttribute.END, ConstraintRelation.EQ,
            null, ConstraintAttribute.END, 1.0, -8.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            null, ConstraintAttribute.TOP, ConstraintRelation.EQ,
            button1, ConstraintAttribute.TOP, 1.0, -8.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            null, ConstraintAttribute.TOP, ConstraintRelation.EQ,
            button2, ConstraintAttribute.TOP, 1.0, -8.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button1, ConstraintAttribute.BOTTOM, ConstraintRelation.EQ,
            button3, ConstraintAttribute.TOP, 1.0, -12.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button2, ConstraintAttribute.BOTTOM, ConstraintRelation.EQ,
            button3, ConstraintAttribute.TOP, 1.0, -12.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button3, ConstraintAttribute.HEIGHT, ConstraintRelation.EQ,
            button1, ConstraintAttribute.HEIGHT, 1.0, 0.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button3, ConstraintAttribute.HEIGHT, ConstraintRelation.EQ,
            button2, ConstraintAttribute.HEIGHT, 1.0, 0.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);

        constraint = new Constraint (
            button3, ConstraintAttribute.BOTTOM, ConstraintRelation.EQ,
            null, ConstraintAttribute.BOTTOM, 1.0, -8.0, ConstraintStrength.REQUIRED
        );
        manager.add_constraint (constraint);
    }

    protected override void dispose () {
        button1.unparent ();
        button2.unparent ();
        button3.unparent ();

        base.dispose ();
    }
}