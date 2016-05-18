module ToyRobot
 class Main

   COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT EXIT]

   attr_reader :robot

   def initialize
     @robot = Robot.new
   end

   def run
     while command = gets
       _command = command.split.first.upcase
       puts "Invalid command, please use #{COMMANDS.join(", ")}" and next unless command_exists?(_command)

       begin
         case _command
           when /EXIT/
             break
           when /PLACE/
             x,y,direction = process_place_command command
             @robot.place x,y,direction
           when /MOVE/
             @robot.move!
           when /LEFT/
             @robot.left!
           when /RIGHT/
             @robot.right!
           when /REPORT/
             puts @robot.current_location.to_array.join(",")
         end
       rescue Exception => e
        puts e.message and next
       end

     end
   end

   private

   def command_exists? command
     COMMANDS.include?(command)
   end

   def process_place_command command
     x,y,direction = command.split(' ',2).last.split(',')
     raise Error::CommandError unless x.to_i.to_s == x
     raise Error::CommandError unless y.to_i.to_s == y
     raise Error::CommandError unless Direction.valid_direction? direction.strip.upcase
     return x.to_i,y.to_i,direction.strip.upcase
   end

 end
end
