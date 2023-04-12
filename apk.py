import os
import requests
import webbrowser
from requests_toolbelt.multipart import encoder
import sys
# 执行脚本 python3 apk.py
# 依赖  requests_toolbelt  执行pip3 install  requests_toolbelt
# 依赖  requests  执行pip3 install  requests


# 华为渠道release包 flutter build apk  --flavor huawei --release
# packaging = 'flutter build apk --release'
packaging = 'flutter build apk --split-per-abi --no-shrink'

# 文件名
# fileName = 'app-release.apk'
fileName = 'app-armeabi-v7a-release.apk'

# 获取路径
currentPath = os.getcwd()

# 拼接文件路径
filePath = currentPath + '/build/app/outputs/flutter-apk/'+fileName

# 获取文件大小
fileLength = os.path.getsize(filePath)

# 更新信息
buildUpdateDescription = ''

# 蒲公英上传地址
url = 'https://www.pgyer.com/apiv2/app/upload'

# 蒲公英_api_key
apiKey = '44a3d6e9aa4d91a7cb55a853efc85e5d'


def buildAPK():
    try:
        print('开始打包' + packaging)
        os.system(packaging)
        print('打包完成 -- 开始上传')
        uploadFile()
    except KeyError as e:
        print(e)

# 上传到蒲公英
def uploadFile():
    file = open(filePath, 'rb')
    e = encoder.MultipartEncoder(
        fields={
            '_api_key': apiKey,
            'file': (fileName, file, 'application/x-www-form-urlencoded'),
            'buildUpdateDescription': buildUpdateDescription,
        },
    )
    m = encoder.MultipartEncoderMonitor(e, my_callback,)
    res = requests.post(url, data=m, headers={'Content-Type': m.content_type}).json()
    print('')
    print(res)
    code = res['code']
    if code == 0 :
        print('上传成功')
        # webbrowser.open(url=res['data']['buildQRCodeURL']) //不想打开浏览器可以注释掉
    else:
        print('上传失败')




def my_callback( monitor):
    total = 50
    fileLength = os.path.getsize(filePath)
    pro = int((monitor.bytes_read * 1.0) / fileLength * 1.0 * total)
    unit = 1000 * 1000.0
    sys.stdout.write(
        '\r' + str(pro * '\033[46;34m \033[0m') + str((total - pro) * '\033[40;30m \033[0m') + '[{0}M/{1}M]'.format(
            round(monitor.bytes_read / unit, 2), round(fileLength / unit, 2)))
    sys.stdout.flush()


if __name__ == '__main__':
    args = sys.argv

    if(len(args) >= 2):
        buildUpdateDescription = args[1]  # 更新信息
    buildAPK()