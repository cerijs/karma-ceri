# karma-ceri

Used in conjuction with the `tests` mixin to be able to have the unit tests integrated in a development view.

## Install

```
npm install --save-dev karma-ceri
```

but also comes with [ceri-dev-server](https://github.com/cerijs/ceri-dev-server)
and can be used like this: `ceri-dev-server --test`

## Usage

```coffee
mixins: [ require("ceri/lib/tests") ]
# usage
tests: (el) -> # el will be on dom
  describe "your compontent", ->
    it "should exist", ->
      should.exist(el)
```

## karma.conf
```coffee 
# karma.conf
  config.set
    preprocessors:
      "**/*.coffee": ["webpack"]
    webpack:
      devtool: 'cheap-eval-source-map'
      resolve:
        extensions: [".js",".coffee"]
        alias:
          ce: path.dirname(require.resolve("ceri"))
      module:
        rules: [
          { test: /\.coffee$/, loader: "coffee-loader" }
        ]
      plugins: [
        new webpack.DefinePlugin "process.env.NODE_ENV": JSON.stringify('test')
      ]
    files: ["dev/*.coffee"]
    frameworks: ["mocha","chai-dom","chai-spies","chai","ceri"]
    plugins: [
      require("karma-chai")
      require("karma-chai-dom")
      require("karma-chrome-launcher")
      require("karma-firefox-launcher")
      require("karma-mocha")
      require("karma-webpack")
      require("karma-chrome-launcher")
    ]
```

## License
Copyright (c) 2017 Paul Pflugradt
Licensed under the MIT license.
