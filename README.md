typeahead-cli
=============

a command line interface for typeahead (auto-completion) services

How to use ?

  1. Provide Solr information (host, port, query to be excuted) in the search.coffee 
  (it will be provided in a separated config file soon)
  2. Having terms indexed in Solr, run:
    - coffee typeahed-cli.coffee
    (the program brings and presents all suggestions based on the typed letters)


Obs: the suggestions are bring for more than one typed letter, special characters (e.g., ç, á, à) are not supported yet
