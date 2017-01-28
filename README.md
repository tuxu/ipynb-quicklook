# ipynb-quicklook

A Quick Look generator for
[Jupyter](https://jupyter.org/)/[IPython](https://ipython.org/) notebooks
without further dependencies. Contents are rendered on-the-fly using
[nbviewer.js](https://github.com/kokes/nbviewer.js).

## Getting started

- Download `ipynb-quicklook.qlgenerator` 
- Move the generator into `/Library/QuickLook`. You may need to run `qlmanage
  -r` to reset the Quick Look server and caches.
- Press <kbd>space</kbd> whenever you encounter a `.ipynb` file. Enjoy 👍

## Similar projects

- [jupyter-notebook-quick-look](https://github.com/jendas1/jupyter-notebook-quick-look):
  renders using the `nbconvert` utility.

## Acknowledgments

- Ondrej Kokes for [nbviewer.js](https://github.com/kokes/nbviewer.js)

## License

This project is licensed under the MIT license. See [LICENSE.md](LICENSE.md) for
details.

© 2017 [Tino Wagner](http://www.tinowagner.com/)