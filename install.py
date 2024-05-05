#!/usr/bin/env python3
'''setup dotfiles
'''
from pathlib import Path
import tomllib
import argparse



def process_path(path: Path):
    # return path.expanduser()
    return path.resolve()

def make_link(target, link, test_mode: bool):
    target = Path(target).resolve()
    link = Path(link).expanduser()

    if not target.exists():
        raise FileNotFoundError(f'{target=}')

    print(f'{link} --> {target}')
    if test_mode:
        return

    if link.exists():
        # TODO rm
        if link.is_symlink():
            link.unlink()
        else:
            link.rename(link.with_suffix('.bak'))

    link.parent.mkdir(parents=True, exist_ok=True)
    link.symlink_to(target)


def process(data, test_mode: bool):
    if 'target' in data and 'link' in data:
        make_link(target=data['target'], link=data['link'], test_mode=test_mode)
    else:
        for _, value in data.items():
            process(value, test_mode=test_mode)

def run(test_mode: bool):
    root_dir = Path(__file__).parent
    config_file = root_dir / 'config.toml'
    with open(config_file, 'rb') as stream:
        config = tomllib.load(stream)
    process(config, test_mode=test_mode)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--test', action='store_true', default=False,
                        help='test mode')
    args = parser.parse_args()
    run(
        test_mode=args.test
    )


if __name__ == '__main__':
    main()
