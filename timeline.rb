#!/usr/bin/env ruby
#-----------------------------------------------
# Timeline
#-----------------------------------------------
# Mau Magnaguagno
#-----------------------------------------------

if ARGV[0] == '-h'
  puts 'ruby timeline.rb [filename=README.md] [dir=LR]'
else
  # Arguments
  filename = ARGV[0] || 'README.md'
  dir = ARGV[1] || 'LR'
  # Setup
  nodes = Hash.new {|h,k| h[k] = []}
  url = {}
  node_counter = cluster_counter = 0
  output = "digraph timeline {\n  rankdir=#{dir}\n  nodesep=0.15\n  node [shape=box target=_blank]\n\n"
  File.foreach(filename) {|line|
    case line
    # Node
    when /^-\s*\[(.+)\](.*)/
      nodes[$1] << "node_#{node_counter}"
      output << "    node_#{node_counter} [label=\"#{$2.split.unshift($1).join('\n')}\"#{url[$1]}]\n"
      node_counter += 1
    # Cluster
    when /^##\s+(.*)/
      # Close previous cluster
      output << "  }\n\n" if cluster_counter != 0
      output << "  subgraph cluster_#{cluster_counter} {\n    label=\"#{$1}\"\n    order_node_#{cluster_counter} [shape=point height=0 style=invis]\n"
      cluster_counter += 1
    # URL and tooltip
    when /^\[(.+)\]:\s+(\S+)(?>\s+("[^"]+"))?$/
      url[$1] = " URL=\"#{$2}\"#{" tooltip=#{$3}" if $3}"
    end
  }
  # Close last cluster
  output << "  }\n" if cluster_counter != 0
  # Add invisible edges between clusters to enforce order
  if cluster_counter > 1
    cluster_counter.pred.times {|i| output << "\n  order_node_#{i} ->"}
    output << "\n  order_node_#{cluster_counter.pred} [style=invis]\n"
  end
  # Add edges between nodes
  nodes.each_value {|parts| output << "\n  " << parts.join(' -> ') if parts.size > 1}
  # Save file
  File.write("#{filename}.dot", output << "\n}")
end