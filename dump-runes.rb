#!/usr/bin/env ruby

require_relative './syllables'

if ARGV.length != 2
  puts "usage: dump-runes.rb DEVELOPERS-URBIT-ORG-CHECKOUT-PATH OUTPUT-PATH"
  exit 1
end

# path of a checkout of https://github.com/urbit/developers.urbit.org
developers_urbit_org_dir = ARGV[0]

# path to output the dumped runes to
output_dir = ARGV[1]

rune_reference_path = File.join(developers_urbit_org_dir, "content/reference/hoon/rune")

def dump_combined_rune_reference_file(input_path, output_dir)
  output_file = nil

  File.open(input_path) do |f|
    f.each_line do |l|
      if l =~ /\A## `..` "(......)"\n\z/
        # section for a new rune.
        rune_name = $~[1]

        output_file&.close
        output_file = File.open(File.join(output_dir, rune_name+".md"), "w")
      end

      if output_file
        output_file << l
      end
    end

    output_file&.close
  end
end

EXCLUDE_FILES = ["_index.md", "constants.md", "terminators.md"]

Dir[rune_reference_path + "/*"].each do |full_path|
  basename = File.basename(full_path)
  next if EXCLUDE_FILES.member?(basename)

  dump_combined_rune_reference_file(full_path, output_dir)
end
