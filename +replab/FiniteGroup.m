classdef FiniteGroup < replab.FinitelyGeneratedGroup
    
    methods
        
        function b = contains(self, g)
        % Returns true when this group contains the element "g"
        % and false otherwise
            error('Not implemented');
        end
        
        function b = knownOrder(self)
        % Returns true if this group order has been computed
            error('Not implemented');
        end
        
        function o = order(self)
        % Returns the order of this group, computing it if
        % necessary, as a "vpi" integer
            error('Not implemented');
        end
        
        function e = elements(self)
        % Returns an Enumerator that enumerates all the elements
        % of this group, using a representation efficient in space
        % if available
            error('Not implemented');
        end

    end
    
    methods
        
        function s = str(self)
            if self.knownOrder
                h = sprintf('%s instance with %d generators of order %s', class(self), self.nGenerators, strtrim(num2str(self.order)));
            else
                h = sprintf('%s instance with %d generators', class(self), self.nGenerators);
            end
            gens = {};
            for i = 1:self.nGenerators
                genName = char('a' + i - 1);
                gens{end+1} = sprintf('  %s: %s', genName, replab.strOf(self.generators{i}));
            end
            s = strjoin({h gens{:}}, char(10));
        end
        
        function g = sampleUniformly(self)
        % Returns an element sampled uniformly from this group
            g = self.elements.sample;
        end
        
    end

    properties (Access = protected)
        randomBag_ = []; % Generator for random elements
    end
    
    methods
        
        function R = randomBag(self)
            if isequal(self.randomBag_, [])
                self.randomBag_ = replab.RandomBag(self.G, self.generators);
            end
            R = self.randomBag_;
        end
        
    end

end
