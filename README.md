# Abstract Syntax Tree and Token Tools

The overall goal is to publish [Leo Editor][1]'s [AST parser][2] as a standalone library that can be used by any python project.

This repo is highly experimental while we figure the best way to package the project. The library however has a lot of development and testing behind it and is not (so) experimental.

Requires: Python 3.6 or greater

# Development environment

*Example using Anaconda/Miniconda environment manager.*

    conda create -n leo-ast
    conda activate leo-ast
    conda install python=3.6
    
    pushd path/to/my/devspace
    git clone https://github.com/leo-editor/ast-token-tools
    pushd ast_token_tools
    pip install -e .
    
    echo "from ast_token_tools import leoAst as last" > a-last-hello.py
    echo "print(last.hello())" >> a-last-hello.py
    
    python a-last-hello.py

_the 2 lines at end will fail. The function 'hello()' doesn't exist yet. ;-)_


  [1]: http://leoeditor.com/
  [2]: https://github.com/leo-editor/leo-editor/blob/master/leo/core/leoAst.py
