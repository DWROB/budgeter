class ExpensesController < ApplicationController

    def index
       Expense.where(users_id: params[:user_id])
    end

    def show
        Expense.where(id: params[:id])
    end

    def create
        Expense.create(expense_params)
    end

    def edit
       @expense = Expense.find(id: params[:id])

       @expense.update_attributes(expense_params)
    end

    private

    def expense_params
       params.require(:expense).permit(:supplier, :users_id, :expense_types_id, :amount)
    end
end
