# Gtk4 Constraints Simple

## Table of Contents

- [About](#about)
- [Usage](#usage)
- [Contributing](../CONTRIBUTING.md)

## About <a name = "about"></a>

GtkConstraintLayout provides a layout manager that uses relations between widgets (also known as "constraints") to compute the position and size of each child.

### Prerequisites

Gtk4 version > 3.95

### Installing

Simple `meson` project.

```
> meson --prefix=/usr builddir
> ninja -C builddir
```

## Usage <a name = "usage"></a>

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

