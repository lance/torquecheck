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
  class Bundler
    def self.display
      begin
        require 'bundler/setup'
        require 'bundler/version'
        require 'bundler/cli'
        require 'bundler'
        print_basics
        print_bundle
      rescue SystemExit
        # Fucking bundler
      rescue Exception => e
        puts "Bundler not installed: #{e}"
      end
    end

    private
    def self.print_basics
      puts "Version: #{::Bundler::VERSION}"
    end

    def self.print_bundle
      begin
        puts "Bundle path: #{::Bundler.bundle_path}"
        ::Bundler::CLI.new
        puts "Bundler settings: "
        ::Bundler.settings.all.each do |setting|
          puts "  #{setting}"
          ::Bundler.settings.pretty_values_for(setting).each do |line|
            puts "    #{line}"
          end
        end
      rescue ::Bundler::GemfileNotFound => e
        puts "#{Dir.pwd} does not contain a Gemfile."
      end
    end
  end
end

