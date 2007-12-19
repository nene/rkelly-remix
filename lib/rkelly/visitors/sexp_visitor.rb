module RKelly
  module Visitors
    class SexpVisitor < Visitor
      #def visit_Node(o)
      #  [:lit, o.value]
      #end

      def visit_NumberNode(o)
        [:lit, o.value]
      end

      def visit_RegexpNode(o)
        [:lit, o.value]
      end

      def visit_AssignExprNode(o)
        [:assign, o.value.accept(self)]
      end

      def visit_VarDeclNode(o)
        [:var_decl, o.name.to_sym, o.value.accept(self)]
      end

      def visit_VarStatementNode(o)
        [:var, o.value.map { |x| x.accept(self) }]
      end

      def visit_NullNode(o)
        [:nil]
      end
      
      def visit_StringNode(o)
        [:str, o.value]
      end

      def visit_FalseNode(o)
        [:false]
      end

      def visit_TrueNode(o)
        [:true]
      end

    end
  end
end
