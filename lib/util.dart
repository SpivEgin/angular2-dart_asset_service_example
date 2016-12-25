String camelName(String name) =>
    name?.replaceAll("_", "-")
        ?.replaceAll(" ", "-")
        ?.toLowerCase()
        ?.split('-')
        ?.map((String e) => e[0].toUpperCase() + e.substring(1))
        ?.join('');

String slugName(String name) =>
    name?.replaceAll("_", "-")
        ?.replaceAll(" ", "-")
        ?.toLowerCase();