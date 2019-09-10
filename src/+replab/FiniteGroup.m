classdef FiniteGroup < replab.FinitelyGeneratedGroup
    
    properties
        niceMonomorphism % Injective group homomorphism from this group into a permutation group
    end

    methods
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.FinitelyGeneratedGroup(self);
            if self.knownOrder
                names{1, end+1} = 'order';
                values{1, end+1} = self.order;
            end
        end

        function b = knownOrder(self)
        % Tests whether the group order has been computed
        %
        % Returns:
        %   logical: True if this group order has been computed
            error('Not implemented');
        end
        
        function o = order(self)
        % Returns the group order, computing it if necessary
        %
        % Returns:
        %   vpi: Order of this group
            error('Not implemented');
        end
        
        function e = elements(self)
        % Returns an enumeration of the group elements
        %
        % Returns:
        %   replab.Enumerator: A space-efficient enumeration of the group elements
            error('Not implemented');
        end
        
        function d = decomposition(self)
        % Returns a decomposition of this group as a product of sets
        %
        % Returns:
        %   replab.FiniteGroupDecomposition: The group decomposition
            assert(self.order < 1e6, 'Default decomposition is available only for small groups');
            O = double(self.order);
            C = self.elements.toCell;
            idIndex = self.elements.find(self.identity);
            C = C([idIndex setdiff(1:O, idIndex)]);
            T = cell(1, O);
            T{1} = self.identity;
            ind = 2;
            for i = 1:O
                if i ~= idIndex
                    T{ind} = self.elements.at(i);
                    ind = ind + 1;
                end
            end
                
            C = self.elements.toCell;
            idIndex = [];
            for i = 1:length(C)
                if self.isIdentity
            
        end

        function g = sampleUniformly(self)
            g = self.elements.sample;
        end
               
        function rho = rep(self, field, dimension, images)
        % Constructs a finite dimensional real or complex representation of this group
        %
        %     field: 'R' or 'C' for real or complex
        % dimension: representation dimension
        %    images: 1 x n cell array of matrices providing the images
        %            of the group generators
            rho = replab.RepByImages(self, field, dimension, self.niceMonomorphism, images);
        end

        function rho = permutationRep(self, dimension, permutations)
        % Returns a real permutation representation of this group
        %
        %    dimension: dimension of the representation
        % permutations: row cell array of images of the generators as permutations of size "dimension"
            S = replab.Permutations(dimension);
            f = @(g) S.toMatrix(g);
            images = cellfun(f, permutations, 'uniform', 0);
            rho = self.rep('R', dimension, images);
        end
        
        function rho = signedPermutationRep(self, dimension, signedPermutations)
        % Returns a real signed permutation representation of this group
        %
        %          dimension: dimension of the representation
        % signedPermutations: row cell array of images of the generators as permutations of size "dimension"
            S = replab.SignedPermutations(dimension);
            f = @(g) S.toMatrix(g);
            images = cellfun(f, signedPermutations, 'uniform', 0);
            rho = self.rep('R', dimension, images);
        end

        function rep = leftRegularRep(self)
            o = self.order;
            assert(o < 1e6);
            o = double(o);
            perms = cell(1, self.nGenerators);
            E = self.elements;
            for i = 1:self.nGenerators
                g = self.generator(i);
                img = zeros(1, o);
                for j = 1:o
                    img(j) = double(E.find(self.compose(g, E.at(j))));
                end
                perms{i} = img;
            end
            rep = self.permutationRep(o, perms);
        end

    end

    
    methods
        
        function R = randomBag(self)
            if isequal(self.randomBag_, [])
                self.randomBag_ = replab.RandomBag(self, self.generators);
            end
            R = self.randomBag_;
        end
        
    end

end
