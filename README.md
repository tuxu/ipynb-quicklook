# ipynb-quicklook

**Note**: This plugin has now been integrated into a native macOS app, [Jupyter
Notebook Viewer](https://github.com/tuxu/nbviewer-app). This is the recommended
way to install the QuickLook generator.

A stand-alone [Quick Look](https://en.wikipedia.org/wiki/Quick_Look) generator
for [Jupyter](https://jupyter.org/)/[IPython](https://ipython.org/) notebooks on
macOS. Contents are rendered on-the-fly using
[nbviewer.js](https://github.com/kokes/nbviewer.js).

## Getting started

- Download `ipynb-quicklook.qlgenerator`
  ([Releases](https://github.com/tuxu/ipynb-quicklook/releases))
- The generator is unsigned and not notarized by Apple. You need to remove the
  quarantine attribute like this on macOS Catalina and later 
  ([#6](https://github.com/tuxu/ipynb-quicklook/issues/6)):
  ```sh
  xattr -d com.apple.quarantine ipynb-quicklook.qlgenerator
  ```
- Move the generator into `/Library/QuickLook` [^1]. You may need to run `qlmanage
  -r` to reset the Quick Look server and caches.
- Press <kbd>space</kbd> whenever you encounter a `.ipynb` file. Enjoy 👍

[^1]: Note that the generator must be installed globally. Installation to
  `~/Library/QuickLook/` is not sufficient (see
  [#4](https://github.com/tuxu/ipynb-quicklook/issues/4)).

## Similar projects

- [jupyter-notebook-quick-look](https://github.com/jendas1/jupyter-notebook-quick-look):
  renders using the `nbconvert` utility.

## Acknowledgments

- Ondrej Kokes for [nbviewer.js](https://github.com/kokes/nbviewer.js)

## License

This project is licensed under the MIT license. See [LICENSE.md](LICENSE.md) for
details.

© 2017 [Tino Wagner](http://www.tinowagner.com/)
