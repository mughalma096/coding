class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :destroy

  def index
    @employees = User.all
  end

  def show
  end

  def new
    @employee = User.new
  end

  def edit
  end

  def create
    @employee = User.new(employee_params)
    @employee.password = '123456'
    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_path @employee, notice: 'Employee was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_path @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Employee was successfully destroyed.' }
    end
  end

  private
    def set_employee
      @employee = User.find(params[:id])
    end

    def employee_params
      params.require(:user).permit(:first_name,:last_name,:email)
    end
end
