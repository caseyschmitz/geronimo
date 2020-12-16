import speedtest
from datetime import datetime

def run(servers=[]):
    test = speedtest.Speedtest()
    
    if servers:
        test.get_servers(servers)
    test.get_best_server()

    test.download()
    test.upload()

    test.results.share()

    result = test.results.dict()
    return result

if __name__ == '__main__':
    from pprint import pprint
    speedtest = run(servers=['16621'])
    pprint(speedtest)