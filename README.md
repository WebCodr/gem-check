# Gem Check

Gem Check is small Ruby script to scan your `Gemfile.lock` file for malicious Gems hosted on RubyGems. Those Gems use names very similar to many popular Gems.

More details: https://blog.reversinglabs.com/blog/mining-for-malicious-ruby-gems

List of malicious Gems: https://blog.reversinglabs.com/hubfs/Blog/ruby_malicious_gems.txt

A big thanks to Reversing Labs for finding those Gems and providing a list of them!

## Usage

1. Clone this repo
2. Copy your `Gemfile.lock` file into the cloned repo
3. Run `ruby check_gems.rb` inside the repo directory

If the script has found any malicious Gems, it will display a list of them and you can clean up your app.
