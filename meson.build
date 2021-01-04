project (
    'github.aeldemery.gtk4_constraints_simple',
    'c', 'vala',
    version: '0.1.1',
)

sources = files (
    'src/Main.vala',
    'src/SimpleGrid.vala',
    'src/MainWindow.vala',
)

sources += import('gnome').compile_resources (
    'project-resources',
    'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data',
)

dependencies = [
    dependency ('gobject-2.0'),
    dependency ('glib-2.0'),
    dependency ('gtk4', version: '>= 4.0.0'),
    meson.get_compiler('c').find_library ('m', required: false),
]

executable (
    meson.project_name(),
    sources: sources,
    dependencies: dependencies,
    install: true,
)
