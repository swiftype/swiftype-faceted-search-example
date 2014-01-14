# Swiftype Faceted Search JavaScript Example

This is a simple read-only e-commerce application designed to demonstrate basics of faceted search using [Swiftype](https://swiftype.com) via [Swiftype Autocomplete jQuery](https://github.com/swiftype/swiftype-autocomplete-jquery) and [Swiftype Search jQuery](https://github.com/swiftype/swiftype-search-jquery) plugins.

## Running the example application

1. Open `seed_sample_data.rb` and replace `'YOUR_API_KEY'` with your key. You can find your API key in your [Settings](https://swiftype.com/settings/account)

2. Make sure you have Swiftype Ruby gem installed. If not, run `gem install swiftype`.

3. Run `ruby seed_sample_data.rb` which will do two things:
  - Create new engine called `e-commerce-store`.
  - Populate the engine with 50 sample products.

4. Go to `https://swiftype.com/home` and copy `Engine Key` for `e-commerce-store`

5. Open `index.html` with any text editor and replace two mentions of `'YOUR_API_KEY'` with your previously copied Engine Key

6. You are all set! Open `index.html` in your browser to browse the example application.

## Using the example application

- Type `Product` in the search box and press `Enter`
- Change options on left hand size to update the results by tags, categories, prices, or date it was added.
