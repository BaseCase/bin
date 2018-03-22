#!/usr/bin/env python3

import sys

def main():
    if not len(sys.argv) == 2:
        print("Please provide exactly one filename.")
        sys.exit(1)
    filename = sys.argv[1]
    toc = generate_toc_for_file(filename)
    print('\n'.join(toc))

def generate_toc_for_file(filename):
    flat_contents = []
    with open(filename) as f:
        for line in f.readlines():
            if line.startswith('#'):
                flat_contents.append(parse_header_line(line))
    return tocify(flat_contents)

def parse_header_line(text):
    split = text.split(' ')
    header_level = len(split[0])
    header_text = ' '.join(split[1:]).strip()
    return (header_level, header_text)

def tocify(contents):
    toc = []
    for (level, text) in contents:
        indent = '    ' * (level - 1)
        row = "{indent}- [{title}]({href})".format(
            indent=indent,
            title=text,
            href=generate_href(text))
        toc.append(row)
    return toc

def generate_href(title):
    return ('#' + title
        .strip()
        .lower()
        .replace(' ', '-')
        .replace('/', '')
        .replace('.', '')
        .replace(',', '')
        .replace('`', '')
        .replace('(', '')
        .replace(')', '')
    )

if __name__ == '__main__':
    main()
