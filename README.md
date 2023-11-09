# BsbNz

BSB lookup for New Zealand bank branches, and its data source is from [paymentsnz.co.nz](https://www.paymentsnz.co.nz/resources/industry-registers/bank-branch-register)

It's heavily inspired from the [BSB gem](https://github.com/zeptofs/bsb) for Australia

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bsb_nz'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bsb_nz

## Usage

### Lookup


To lookup a BSB number:

```ruby
BsbNz.lookup "010004"
```

and got

```ruby
{
    :bank_number=>"01",
    :branch_number=>"0004",
    :national_clearing_code=>"010004",
    :bic=>nil,
    :bank_name=>"ANZ Bank New Zealand",
    :branch_information=>"ANZ Retail 2",
    :city=>"Wellington",
    :physical_address_1=>"215-229 Lambton Quay",
    :physical_address_2=>nil,
    :physical_address_3=>nil,
    :physical_address_4=>nil,
    :post_code=>"6001",
    :location=>nil,
    :country_name=>"New Zealand",
    :pob_number=>"PO Box 1393",
    :pob_location_1=>"Wellington",
    :pob_location_2=>nil,
    :pob_location_3=>nil,
    :pob_post_code=>"6140",
    :pob_country=>"New Zealand",
    :std=>"(04)",
    :phone=>"0800 269 296",
    :fax=>"496-7360",
    :retail=>nil,
    :bic_plus_indicator=>"Y",
    :latest_status=>"A"
}
```

### Update source

use rake task to fetch data from `paymentsnz.co.nz` and generate the data file (default to `lib/data/bsb_branch_list.json`)

```bash
bundle exec rake bsb_nz:generate_branch_list
```

The rake task will verify the md5 of the data file, if it is changed, it will show
```bash
"!!! Data file changed. please update GEM VERSION !!!"
```
