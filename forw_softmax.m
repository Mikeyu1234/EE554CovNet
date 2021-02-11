function [yi]=forw_softmax(vec)

expo=exp(vec);
yi=expo/sum(expo);

end
