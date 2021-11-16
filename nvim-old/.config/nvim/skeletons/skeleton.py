"""
"""
import sys
import argparse


def parse_args():
    """Parse input arguments"""
    parser = argparse.ArgumentParser()

    args = parser.parse_args()
    return args


def main(args):
    """Main function"""
    return 0


if __name__ == '__main__':
    sys.exit(main(parse_args()))
