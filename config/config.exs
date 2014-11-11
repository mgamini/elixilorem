use Mix.Config

config :elixilorem,
  extension: ".txt",
  flavors: ["lorem_ipsum", "iliad", "frankenstein", "lorem_ipsum", "riker", "cat"],
  flavor: "lorem_ipsum",
  format: "text",
  joins: [paragraphs: "\n", sentences: ". ", words: " "]
