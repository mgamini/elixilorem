# Elixilorem
[![Master](https://travis-ci.org/mgamini/elixilorem.svg?branch=master)](https://travis-ci.org/mgamini/elixilorem)

## Getting Started
It's a Hex.pm package, so drop it in like every other package:

```elixir
defp deps do
  [{:elixilorem, "~> 0.0.1"}]
end
```

## What does it do?
Based upon [Dimsum](https://github.com/ninjascribble/dimsum) by my buddy Scott, it generates filler text for your Elixir project. This is particularly useful for web projects (see [Phoenix](https://github.com/phoenixframework/phoenix)).

## Usage
```elixir
iex> Elixilorem.word
"Urna"
iex> Elixilorem.words 3
"Etiam non diam"
iex> Elixilorem.words 3, %{flavor: "cat"}
"Hack up furballs"
iex> Elixilorem.sentence
"Integer iaculis lacinia massa."
iex> Elixilorem.paragraph
"Donec imperdiet. Vestibulum auctor tortor at orci. Integer semper, nisi eget suscipit eleifend, erat nisl hendrerit justo, eget vestibulum lorem justo ac leo. Integer sem velit, pharetra in, fringilla eu, fermentum id, felis. Vestibulum sed felis. In elit. Praesent et pede vel ante dapibus condimentum. Donec magna. Quisque id risus. Mauris vulputate pellentesque leo. Duis vulputate, ligula at venenatis tincidunt, orci nunc interdum leo, ac egestas elit sem ut lacus. Etiam non diam quis arcu egestas commodo. Curabitur nec massa ac massa gravida condimentum. Aenean id libero. Pellentesque vitae tellus. Fusce lectus est, accumsan ac, bibendum sed, porta eget, augue. Etiam faucibus. Quisque tempus purus eu ante."
```

##Future features
- HTML format