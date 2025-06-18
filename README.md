# SUBSCRIBE challenge

### Folder structure

```
.
├── Gemfile
├── Gemfile.lock
├── input
│   ├── input1.txt
│   ├── input2.txt
│   ├── input3.txt
│   └── process.rb
├── product
│   ├── classifier.rb
│   ├── record.rb
│   └── tax_calculator.rb
├── README.md
├── setup.rb
└── spec
    ├── input
    │   └── process_spec.rb
    ├── product
    │   ├── classifier_spec.rb
    │   ├── record_spec.rb
    │   └── tax_calculator_spec.rb
    └── spec_helper.rb
```

* `input` folder contains the input files and the `process.rb` file that processes the input
* `product` folder contains the classes related to the product
* `setup.rb` is the entry point of the application
* `spec` folder contains the unit tests
* `Gemfile` contains the dependencies
* `README.md` contains the documentation

### Input

The input is a text file with the following format:

```
[quantity] [product description] at [price]
```

### Output
```
ruby setup.rb input/input1.txt

2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.5
Total: 42.32
```

### Install dependencies

```
bundle install
```
> Just RSpec for now

### Running the application

```
ruby setup.rb input/input1.txt
```

### Running the tests

```
rspec spec
```

### Choices

* The `Classifier` class is used to classify the product into a category and if it is imported. It works like a parser to get the product information.
* The `TaxCalculator` module is used to calculate the taxes for the product.
* The `Record` class represents the product instance and its information.

> The idea of the folders structure is to keep the code close to the problem domain.

### Improvements

* [x] Add unit tests for all classes
* [ ] Add validations
* [ ] Use the gem `money` to handle precision and rounding
* [ ] Add more product categories
* [ ] Review the complexity of using`find` and `include?` methods at the `Classifier` class
