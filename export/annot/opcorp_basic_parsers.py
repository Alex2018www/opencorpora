#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import xml.sax
from xml.sax.saxutils import escape

"""utilities for parsing opencorpora with sax and copying it"""
class OpcorpBasicParser(xml.sax.ContentHandler):
    TAG_PARAGRAPH = 'paragraph'
    TAG_SENTENCE = 'sentence'
    TAG_SOURCE = 'source'
    TAG_TOKENS = 'tokens'
    TAG_TOKEN = 'token'
    TAG_TFR = 'tfr'
    TAG_VARIANT = 'v'
    TAG_LEXEME = 'l'
    TAG_GRAMMEME = 'g'
    
    
    def __init__(self, id_set):
        super().__init__()
        
        #track the token_ids
        self.id_set = id_set
        self.ids_left = len(self.id_set)
        
    def _new_file(self):
        self.file = open(self.out_filepath, 'wb')
        bang_u = '<?xml version="1.0" encoding="{}"?>'.format(self.encoding)
        self.file.write(bang_u.encode(self.encoding))
        
    def _close_file(self):
        self.file.close()

    def _gen_start_tag(self, name, attrs):
        if not attrs:
            st_u = '\n<{}>'.format(name)
        else:
            attributes = ' '.join('{}="{}"'.format(k, escape(v, {'"': '&quot;'})) \
            for k, v in attrs.items())
            st_u = '\n<{} {}>'.format(name, attributes)

        return st_u.encode(self.encoding)
    
    def _gen_end_tag(self, name):
        st_u = '</{}>'.format(name)
        return st_u.encode(self.encoding)    
    
    def characters(self, content):
        if content.strip():
            self.file.write(escape(content.strip()).encode(self.encoding))
            
    def _are_tokens_found(self):
        return self.ids_left <= 0


class OpcorpDictionaryHandler(xml.sax.ContentHandler):
    TAG_DICT_GRAMMEME = 'grammeme'
    TAG_DICT_GRAMMEME_LIST = 'grammemes'
    
    def __init__(self):
        super().__init__()
        
   



"""a custom Exception class to stop parsing when necessary"""		
class DictionaryEndParseException(Exception):
    pass
