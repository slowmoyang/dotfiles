#!/usr/bin/env python3
'''setup dotfiles
'''
import argparse
from pathlib import Path
import json
import warnings


def run(config):
    root_dir = Path(__file__).parent

    with open(root_dir / 'link.json') as stream:
        link_data: dict[str, str] = json.load(stream)

    source_dir = root_dir / 'config'
    target_dir = Path.home()

    if config.verbose:
        print('# example: link -> data')

    for target, source in link_data.items():
        # data
        source_file = source_dir / source
        if not source_file.exists():
            warnings.warn(f'FileNotFound: {source_file=}')
            continue

        # link
        target_file = target_dir / target
        if target_file.exists():
            if target_file.is_symlink():
                target_file.unlink()
            else:
                print(f'non-symlink file exists. backup {target_file}')
                target_file.rename(target_file.with_suffix('.bak'))

        # make a link pointing to source
        target_file.symlink_to(source_file)
        if config.verbose:
            print(f'{target_file} -> {source_file}')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--verbose', action='store_true', default=False,
                        help='verbose')
    args = parser.parse_args()
    run(args)


if __name__ == '__main__':
    main()
