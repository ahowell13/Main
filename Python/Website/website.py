from flask import Flask

website = Flask(__name__)

@website.route('/')
def index():
    return 'INDEX'

if __name__ == '__main__':
    website.run()

