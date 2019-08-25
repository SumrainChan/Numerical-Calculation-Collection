import requests
from queue import Queue
import re
import numpy as np
import pandas as pd
pattern = re.compile(r'<a href="((https://|http://).+?)"')
url = 'https://www.jnu.edu.cn/'

def getGoogleMatrix(main_url):
    pattern = re.compile(r'<a href="((https://|http://).+?)"')
    matrix = np.zeros((500, 500))
    web_cnt = 0
    web_dict = {}
    web_dict[main_url] = web_cnt
    web_cnt += 1
    url_queue = Queue()
    url_queue.put(main_url)
    while not url_queue.empty():
        c_url = url_queue.get()
        print(web_dict.get(c_url), c_url)
        try:
            req = requests.get(c_url)
        except:
            continue
        content = req.content
        if content is not None:
            try:
                find_url = pattern.findall(str(content, encoding='utf-8'))
                for n_url, tmp in find_url:
                    if n_url not in web_dict.keys():
                        if len(web_dict) < 500:
                            web_dict[n_url] = web_cnt
                            web_cnt += 1
                            url_queue.put(n_url)
                            matrix[web_dict.get(c_url)][web_dict.get(n_url)] = 1
                    else:
                        matrix[web_dict.get(c_url)][web_dict.get(n_url)] = 1
            except:
                pass
    return matrix, web_dict

matrix, dict = getGoogleMatrix(url)
np.savetxt('GoogleMatrix.txt', matrix)
pd.Series(dict).to_csv('WebList.txt')


# url = 'https://hwy.jnu.edu.cn/zhaosheng/index.aspx'
# req = requests.get(url)
# # print(str(req.content, encoding='utf-8'))
# print(req.content.decode('utf-8', 'ignore'))
