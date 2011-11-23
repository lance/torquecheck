# Copyright 2011 Lance Ball
# 
# This is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation; either version 2.1 of
# the License, or (at your option) any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with this software; if not, write to the Free
# Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
# 02110-1301 USA, or see the FSF site: http://www.fsf.org.


module TorqueBox
  class Gem
    def self.display
      print_basics
      print_gem_paths
      print_gem_config
    end

    private
    def self.print_gem_paths
      puts "Gem Paths: "
      path = ::Gem.path.dup
      path.delete ::Gem.dir
      path.each do |p|
        puts "- #{p}\n"
      end
    end

    def self.print_gem_config
      puts "Gem Configuration:\n"
      ::Gem.configuration.each do |name, value|
        value = value.gsub(/./, '*') if name == 'gemcutter_key'
        puts "  #{name.inspect} => #{value.inspect}\n"
      end
      puts "Remote Sources:\n"
      ::Gem.sources.each do |s|
        puts "  #{s}\n"
      end
    end

    def self.print_basics
      puts "Version: #{::Gem::VERSION}"
      puts "Platform: #{::Gem::Platform.local.to_s}"
    end
  end
end

