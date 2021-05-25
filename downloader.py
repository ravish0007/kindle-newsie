import os
import shutil
import yagmail
from datetime import datetime
import configparser

base_dir, _    =  os.path.split(os.path.realpath(__file__))
recipes_dir = base_dir + os.path.sep + 'recipes'
docs_dir    = base_dir + os.path.sep + 'docs'


def mail_docs(docs_dir):
    pass

def make_downloads(recipes_dir, docs_dir):

    try :
       shutil.rmtree(docs_dir)
    except:
       pass
    finally:
       os.makedirs(docs_dir, exist_ok=True)

    now = datetime.now()

    for recipe in os.listdir(recipes_dir):
       doc, _ = os.path.splitext(recipe)
       doc = f'{now.strftime("%b_%d") + doc.center(len(doc)+2, "_")}.mobi'
       os.system(f'/opt/calibre/ebook-convert  {os.path.join(recipes_dir, recipe)} {os.path.join(docs_dir, doc)}')


if __name__ == '__main__':
    make_downloads(recipes_dir, docs_dir)
    mail_docs(docs_dir)
