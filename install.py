#!/usr/bin/env python3
'''setup dotfiles
'''
from pathlib import Path
import toml
import argparse



def process_path(path: Path):
    # return path.expanduser()
    return path.resolve()

def make_link(target, link):
    target = Path(target).resolve()
    link = Path(link).expanduser()

    if not target.exists():
        raise FileNotFoundError(f'{target=}')

    if link.exists():
        # TODO rm
        if link.is_symlink():
            link.unlink()
        else:
            link.rename(link.with_suffix('.bak'))

    link.parent.mkdir(parents=True, exist_ok=True)
    print(f'{link} --> {target}')
    link.symlink_to(target)


def process(data):
    if 'target' in data and 'link' in data:
        make_link(target=data['target'], link=data['link'])
    else:
        for key, value in data.items():
            process(value)

def run(verbose: bool):
    root_dir = Path(__file__).parent
    config = toml.load(root_dir / 'config.toml')
    process(config)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--verbose', action='store_true', default=False,
                        help='verbose')
    args = parser.parse_args()
    run(
        verbose=args.verbose
    )


if __name__ == '__main__':
    main()
