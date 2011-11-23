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
  class Server

    attr_reader :server

    def initialize
      @server = server_gem_path
    end

    def display
      print_server_gem
      print_installed_apps
    rescue Exception => e
      puts "Exception caught: #{e}"
    end

    def print_server_gem
      puts "torquebox-server gem:"
      if server
        puts "  Installed in #{server}"
      else
        puts "  Not installed"
      end
    end

    def print_installed_apps
      if home
        puts "TorqueBox applications installed in #{home}:"
        deploy_dir = File.join( home, "jboss", "standalone", "deployments" )
        if File.exists? deploy_dir
          Dir.glob File.join(deploy_dir, "*.yml") do |f|
            puts "  " + File.basename( f ).gsub( /\.yml/, '' )
          end
        else
          puts "  Cannot find TorqueBox deployment directory #{deploy_dir}"
        end
      else
        puts "  Can't find TorqueBox!"
      end
    end

    def home
      server || ENV['TORQUEBOX_HOME']
    end

    private
    def server_gem_path
      if ((::Gem::Version.new(::Gem::VERSION) <=> ::Gem::Version.new('1.8.9')) < 0)
        puts "[WARNING] Found rubygems version #{::Gem::VERSION}. This probably means you are on JRuby 1.6.4. While JRuby 1.6.4 should work, TorqueBox is tested on and ships with JRuby 1.6.5."
        home = ::Gem.searcher.find( 'torquebox-server' )
      else
        begin
          home = ::Gem::Specification.find_by_name( 'torquebox-server' )
        rescue ::Gem::LoadError
        end
      end
      home.full_gem_path if home
    end
  end
end

