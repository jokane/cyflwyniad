# This module contains code common to all of the scripts in this family.
import hashlib
import mimetypes
import sys
import urllib2
import re
import os

cache_dir = ".cyflwyniad-cache"

def complain(message):
  raise Exception(message)

def get_file(url, mime_type, reason):
  local_name = download_if_needed(url, mime_type, reason)
  to_from(reason, local_name, None)
  return open(local_name, 'r').read()

def to_from(reason, to, fr):
  if not to: to = '[...]'
  if not fr: fr = '[...]'
  if cache_dir in to: to = '(cache)'
  if cache_dir in fr: fr = '(cache)'
  print >>sys.stderr, "[%-20s] %30s --> %s" % (reason, to, fr)

def mkdir_if_needed(d):
  if not os.path.exists(d):
    os.makedirs(d)

def download_if_needed(url, mime_type, reason):
# Make sure that a local or cached copy of the requested URL is available, and
# return its path.  If mime_type is None, guess.

  # If it's a local file, we don't need to do anything.
  if not re.search('^http(s)?:', url):
    return url

  # If it's a URL, download it to our cache.
  mkdir_if_needed(cache_dir)
  if mime_type:
    # MIME type was given.  Use the second part as the file extension.
    extension = '.' + mime_type.split('/')[1]
  else:
    # No MIME type given.  Can we guess?
    mime_type  = mimetypes.guess_type(url)[0]

    if mime_type:
      # Yes.  Use the second part as the file extension.
      extension = '.' + mime_type.split('/')[1]
    else:
      # No.  Is there an extension on the filename?
      match = re.match(r'\.(.*)$', url)
      if match:
        # Yes.  Use it.
        extension = '.' + match.group(1)
      else:
        # No.  Give up.
        extension = ''

  cached_name = os.path.join(cache_dir, hashlib.sha224(url).hexdigest()[:8] + extension)

  if not os.path.isfile(cached_name):
    to_from(reason, url, cached_name)
    try:
      f = urllib2.urlopen(url)
    except Exception as e:
      raise Exception("Failed to open URL '%s': %s" % (url, e))
    x = f.read()
    f = open(cached_name, 'w')
    print >>f, x,
    f.close()
  return cached_name
