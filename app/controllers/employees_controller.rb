class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show dashboard edit update destroy ]

  # GET /employees or /employees.json
  def index
    @employees = Employee.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
    @employee = Employee.new
  end

  def for_select
    @employees = Employee.where("name like ?", "%#{params[:query]}%")
    render json: @employees.map { |employee| { value: employee.id, text: employee.name } }
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@employee, partial: 'employees/form', locals: {employee: @employee})}
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_path, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :email, :password, :password_confirmation, :document, :address, :latitude, :longitude)
    end
end
