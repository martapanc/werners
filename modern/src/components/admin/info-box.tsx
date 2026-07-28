export function InfoBox({
  color,
  icon,
  label,
  value,
}: {
  color: string;
  icon: string;
  label: string;
  value: string;
}) {
  return (
    <div className="flex overflow-hidden rounded-sm bg-white shadow-sm">
      <div className="flex h-20 w-20 items-center justify-center text-2xl text-white" style={{ background: color }}>
        {icon}
      </div>
      <div className="flex flex-1 flex-col justify-center px-4">
        <div className="text-xs uppercase tracking-wide text-zinc-600">
          {label}
        </div>
        <div className="text-xl font-semibold text-zinc-900">{value}</div>
      </div>
    </div>
  );
}

