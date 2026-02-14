#!/usr/bin/env ruby
#-----------------------------------------------
# Timeline
#-----------------------------------------------
# Mau Magnaguagno
#-----------------------------------------------

if ARGV[0] == '-h'
  puts 'ruby timeline.rb [filename=README.md] [dir=LR] [format=nil]'
else
  # Arguments
  filename = ARGV[0] || 'README.md'
  dir = ARGV[1] || 'LR'
  format = ARGV[2]
  # Setup
  nodes = Hash.new {|h,k| h[k] = []}
  info = {}
  node_counter = cluster_counter = 0
  classcolor = ''
  output = "digraph timeline {\n  rankdir=#{dir}\n  nodesep=0.15\n  node [shape=box target=_blank style=filled fillcolor=white]\n\n"
  File.foreach(filename) {|line|
    case line
    # Node
    when /^-\s*\[(.+)\](.*)/
      nodes[$1] << "node_#{node_counter}"
      output << "    node_#{node_counter} [label=\"#{$2.split.unshift($1).join('\n')}\"#{info[$1]}]\n"
      node_counter += 1
    # Cluster
    when /^##\s+(.*)/
      # Close previous cluster
      output << "  }\n\n" if cluster_counter != 0
      output << "  subgraph cluster_#{cluster_counter} {\n    label=\"#$1\"\n    order_node_#{cluster_counter} [shape=point height=0 style=invis]\n"
      cluster_counter += 1
    # URL and tooltip
    when /^\[(.+)\]:\s+(\S+)(?>\s+("[^"]+"))?$/
      info[$1] = " URL=\"#$2\"#{" tooltip=#$3" if $3}#{classcolor}"
    # Class and color
    when /^<!--(\w+)\s+(#?\w+)-->/
      classcolor = " class=\"#$1\" fillcolor=\"#$2\""
    end
  }
  # Close last cluster
  output << "  }\n" if cluster_counter != 0
  # Add invisible edges between clusters to enforce order
  output << "#{Array.new(cluster_counter) {|i| "\n  order_node_#{i}"}.join(' ->')} [style=invis]\n" if cluster_counter > 1
  # Add edges between nodes
  nodes.each_value {|parts| output << "\n  " << parts.join(' -> ') if parts.size > 1}
  # Save file
  File.write("#{filename}.dot", output << "\n}")
  # Generate image with output format
  system("dot #{filename}.dot -O -T #{format}") if format
end