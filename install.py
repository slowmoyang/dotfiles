#!/usr/bin/env python3
'''setup dotfiles
'''
import argparse
from pathlib import Path
import json
import warnings
from socket import gethostname


def run(config):
    root_dir = Path(__file__).parent

    with open(root_dir / 'link.json') as stream:
        link_data: list[dict[str, str]] = json.load(stream)

    target_dir = root_dir / 'config'
    symlink_dir = Path.home()
    hostname = gethostname()

    if config.verbose:
        print('# example: symlink -> target')

    for data in link_data:
        target = data['target']
        symlink = data.get('symlink', '.' + target)

        if 'host' in data and hostname not in data['host']:
            continue

        target_file = target_dir / target
        symlink_file = symlink_dir / symlink

        # check target
        if not target_file.exists():
            warnings.warn(f'FileNotFound: {target_file=}')
            continue

        # check symlnk
        if symlink_file.is_symlink():
            symlink_file.unlink()
        elif symlink_file.exists():
            # FIXME rm option
            symlink_file.rename(symlink_file.with_suffix('.bak'))

        symlink_file.parent.mkdir(parents=True, exist_ok=True)

        # make a link pointing to target
        if config.verbose:
            print(f'{symlink_file} -> {target_file}')
        symlink_file.symlink_to(target_file)



def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--verbose', action='store_true', default=False,
                        help='verbose')
    args = parser.parse_args()
    run(args)


if __name__ == '__main__':
    main()
