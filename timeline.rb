#!/usr/bin/env ruby
#-----------------------------------------------
# Timeline
#-----------------------------------------------
# Mau Magnaguagno
#-----------------------------------------------

if ARGV.first == '-h'
  puts 'ruby timeline.rb [filename=README.md] [dir=LR]'
else
  # Arguments
  filename = ARGV.first || 'README.md'
  dir = ARGV[1] || 'LR'
  # Setup
  nodes = Hash.new {|h,k| h[k] = []}
  url = {}
  cluster = nil
  node_counter = cluster_counter = 0
  output = "digraph timeline {\n  rankdir=#{dir}\n  nodesep=0.15\n\n"
  IO.foreach(filename) {|line|
    case line
    # Node
    when /^-\s*\[(.+)\](.*)$/
      nodes[$1] << "node_#{node_counter}"
      cluster << "    node_#{node_counter} [shape=box label=\"#{$2.split.unshift($1).join('\n')}\" URL=\"#{url[$1].first}\" tooltip=\"#{url[$1].last}\" target=\"_blank\"]\n"
      node_counter += 1
    # Cluster
    when /^##\s+(.*)$/
      # Close and save previous cluster
      output << cluster << "  }\n\n" if cluster
      cluster = "  subgraph cluster_#{cluster_counter} {\n    graph[height=1.65]\n    label=\"#{$1}\"\n    order_node_#{cluster_counter} [shape=point height=0 style=invis]\n"
      cluster_counter += 1
    # URL and tooltip
    when /^\[(.+)\]:\s+([^\s]+)\s+"([^"]*)"$/
      url[$1] = [$2, $3]
    end
  }
  # Close and save last cluster
  output << cluster << "  }\n\n" if cluster
  # Add edges between nodes
  nodes.each_value {|parts| output << '  ' << parts.join(' -> ') << "\n" if parts.size > 1}
  # Add invisible edges between clusters to enforce order
  output << "\n"
  cluster_counter.pred.times {|i| output << "  order_node_#{i} -> order_node_#{i.succ} [style=invis]\n"}
  output << '}'
  # Save file
  IO.write("#{filename}.dot", output)
end