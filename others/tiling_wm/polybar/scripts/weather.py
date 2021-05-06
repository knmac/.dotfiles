"""Show weather using openweathermap API
"""
import sys
import argparse
import requests


def parse_args():
    """Parse input arguments"""
    parser = argparse.ArgumentParser()
    parser.add_argument('--city', type=str,
                        default='4914570')
    parser.add_argument('--api_key', type=str,
                        default='b6fdb8147f09d681dc0e3fee310ddffd')
    parser.add_argument('--unit', type=str, choices=['imperial', 'metrics'],
                        default='imperial')
    parser.add_argument('--detailed', action='store_true')

    args = parser.parse_args()
    return args


def main(args):
    """Main function"""
    url_fmt = 'https://api.openweathermap.org/data/2.5/weather?id={}&appid={}&units={}'
    # icon_dict = {
    #     'clear sky': ' ',
    #     'few clouds': ' ',
    #     'scattered clouds': ' ',
    #     'broken clouds': ' ',
    #     'shower rain': ' ',
    #     'rain': ' ',
    #     'thunderstorm': ' ',
    #     'snow': ' ',
    #     'mist': ' ',
    # }
    unit_dict = {
        'imperial': '°F',
        'metrics': '°C',
    }

    req = requests.get(url_fmt.format(args.city, args.api_key, args.unit))
    try:
        if req.status_code == 200:
            data = req.json()
            if not args.detailed:
                output = '{}, {}{}'.format(
                    data['weather'][0]['description'],
                    int(data['main']['temp']), unit_dict[args.unit]
                )
            else:
                raise NotImplementedError
        else:
            output = 'Weather not available'
    except Exception:
        print('Unexpected error:', sys.exc_info()[0])
        raise

    print(output)
    return 0


if __name__ == '__main__':
    sys.exit(main(parse_args()))
