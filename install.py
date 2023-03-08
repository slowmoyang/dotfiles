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
        link_data: list = json.load(stream)

    target_dir = root_dir / 'config'
    symlink_dir = Path.home()
    hostname = gethostname()

    if config.verbose:
        print('# example: symlink -> target')

    for data in link_data:
        # FIXME
        symlink: str = data[0]
        target: str = data[1]

        if len(data) == 3:
            allowed_hosts = data[2].split(',')
            if hostname not in allowed_hosts:
                continue

        # check target
        target_file = target_dir / target
        if not target_file.exists():
            warnings.warn(f'FileNotFound: {target_file=}')
            continue

        # check symlnk
        symlink_file = symlink_dir / symlink
        if symlink_file.exists():
            if symlink_file.is_symlink():
                symlink_file.unlink()
            else:
                print(f'non-symlink file exists. backup {symlink_file}')
                symlink_file.rename(symlink_file.with_suffix('.bak'))

        symlink_file.parent.mkdir(parents=True, exist_ok=True)

        # make a link pointing to source
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
