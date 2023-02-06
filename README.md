# Quintessence

## Software requirements

- Ensure Python and FontForge are installed, and both are in your PATH environment variable (so they can be invoked from the command line).
- From the root of the repo, run the command `pip install -r requirements.txt` to install the necessary Python packages.

## Building

To build the fonts from scratch, using the provided Windows batch files:

1. Run `generate.bat`; this produces the intermediate sources in UFO format
2. Run `build.bat`; this builds the final OpenType (TTF and WOFF2) fonts
   - If you wish, run `test.bat` to see Font Bakery's test results for the fonts
