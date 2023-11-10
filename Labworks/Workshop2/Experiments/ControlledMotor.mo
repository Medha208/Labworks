within Labworks.Workshop2.Experiments;
model ControlledMotor
  Components.Electrical.ElectricalMotor motor(ratio=2, J=1)
    annotation (Placement(transformation(extent={{-8,-2},{12,18}})));
  Modelica.Blocks.Sources.Constant const
    annotation (Placement(transformation(extent={{-62,0},{-42,20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{40,-2},{60,18}})));
equation
  connect(const.y, motor.v1) annotation (Line(points={{-41,10},{-24.5,10},{
          -24.5,10.2},{-8,10.2}}, color={0,0,127}));
  connect(motor.flange_b1, inertia.flange_a)
    annotation (Line(points={{11.6,6.6},{11.6,8},{40,8}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ControlledMotor;
